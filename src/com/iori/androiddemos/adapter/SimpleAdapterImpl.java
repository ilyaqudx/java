package com.iori.androiddemos.adapter;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Color;
import android.opengl.Visibility;
import android.os.Message;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import android.widget.Toast;

import com.iori.androiddemos.ListViewActivity;
import com.iori.androiddemos.MainActivity;
import com.iori.androiddemos.R;
import com.iori.androiddemos.sms.MessageUtils;
import com.iori.androiddemos.sms.SMS;
import com.iori.androiddemos.utils.ActivityStatus;
public class SimpleAdapterImpl extends SimpleAdapter implements OnClickListener {

	private static Context context ;
	private static List<Map<String, Object>> data ;
	private int resource ;
	private String[] from ;  
	private int[] to ;
	
	/**
	 * 手机发送短信结果状态.0--成功. -1--失败.
	 */
	public static boolean SEND_ORDER_MSG_FAIL = false ;
	
	public static final int FORBIDDEN_ORDER = 4;
	
	public static final String ORDER_DJ_CODE = "KTLLDJ";
	
	public static final String ORDER_CODE_5 = "KTSJLL";
	
	public static final String ADDRESS_10086 = "10086";
	
	public SimpleAdapterImpl(Context context,List<Map<String, Object>> data, int resource, String[] from,
			int[] to) {
		super(context, data, resource, from, to);
		
		this.context = context;
		this.data = data;
		this.resource = resource;
		this.from = from;
		this.to = to;
	}
	
	/**
	 * @param money	传入订购的金额
	 * @return	返回拒绝的信息.
	 */
	private static String getForbiddenInfo(int money){
		
		return "您不允许申请[移动数据流量"+money+"元叠加套餐]";
	}
	
	/**
	 * @param money 订购叠加流量金额.
	 * @return	确认订购叠加流量包信息
	 */
	private static List<String> getQRInfo(int money){
		
		if(money != 0){
			ArrayList<String> qrInfoDJ = new ArrayList<String>();
			qrInfoDJ.add("订购移动数据流量"+money+"元叠加套餐");
			qrInfoDJ.add("确认订购请回复QR");
			return qrInfoDJ ;
		}
		
		return null ;
	}
	
	/**
	 * @return 确认订购手机流量5元套餐,不是叠加的.
	 */
	private static List<String> getQRInfo5(){
		
		ArrayList<String> qrInfo5 = new ArrayList<String>();
		
		qrInfo5.add("申请开通移动数据流量5元套餐");
		qrInfo5.add("确认开通请回复QR");
		
		return qrInfo5;
	}
	
	/**
	 * @param money 传入订购叠加套餐金额
	 * @return	订购叠加流量成功的信息
	 */
	private static String getOrderDJSucInfo(int money){
		return "您已成功开通移动数据流量"+money+"元叠加套餐业务";
	}
	
	/**
	 * @return 返回5元手机流量订购成功信息.不是叠加套餐.
	 */
	private static String getOrderSucInfo5(){
		return "您已成功开通移动数据流量5元套餐业务";
	}
	
	/**
	 * @param position 传入button的索引
	 * @return	返回索引对应的金额
	 */
	private static int getOrderMoney(int position){
		
		int money = -1;
		switch(position){
		case 0 :
			money = 2;
			break;
		case 1 :
			money = 5;
			break;
		case 2 :
			money = 10;
			break;
		case 3 :
			money = 20;
			break;
		case 4 :
			money = 50;
			break;
		case 5 :
			money = 100;
			break;
		case 6 :
			money = 200;
			break;
		}
		
		return money;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		
		View view = super.getView(position, convertView, parent);
		TextView gprs = (TextView) view.findViewById(to[0]);
		TextView mimi = (TextView) view.findViewById(to[1]);
		Button order = (Button) view.findViewById(to[2]);
		order.setTag(position);
		
		gprs.setText(data.get(position).get(from[0]).toString());
		mimi.setText(data.get(position).get(from[1]).toString());
		order.setText(data.get(position).get(from[2]).toString());
		
		//这里设置TAG目的是做为一个标识,因为在LISTVIEW中,如果直接取哪个按钮,是会出错的.它定位不了.
		order.setTag(position);
		order.setOnClickListener(this);
		order.setBackgroundResource(R.drawable.order_btn_selector);
		order.setGravity(Gravity.CENTER);
		
		
		return view;
	}
	
	
	/**
	 * @param money 传入订购叠加流量包的金额
	 * @return	叠加流量包订购的提示信息
	 */
	public static String getDJTipMessage(int money){
		return "亲爱的玩家,您正在请求订购移动数据流量"+money+"元叠加套餐,含"+money+"0M国内流量" +
				",订购当月立即生效,订购费用将从您的话费中扣取,是否确认订购 ?" +
				"\n有疑问请致电 : 400-028-1060";
	}
	
	private static String getTipMessage5(){
		return "亲爱的玩家,该套餐仅限数据流量套餐用户使用,建议您开通移动数据流量5元套餐业务,立即生效!成功开通可获赠5万米米." +
				"订购费用将从您的话费中扣取,是否确认订购?" +
				"\n如有疑问,请致电 : 400-028-1060";
	}

	@Override
	public void onClick(View v) {
		int tag = (Integer) v.getTag();
		orderDJGPRS(tag,null);//这个订购是叠加的,无需传入订购代码.
	}
	
	/**自定义文本居中TEXTVIEW,用作对话框的TITLE.
	 * @param text	显示的文本
	 * @param height 组件的高度
	 * @param textSize	文本大小
	 * @return
	 */
	public static TextView diyTextView(String text,int height,float textSize){
		
		TextView title = new TextView(context);
		title.setText(text);
		title.setHeight(height);
		title.setTextColor(Color.WHITE);
		title.setTextSize(textSize);
		title.setGravity(Gravity.CENTER);
		
		return title ;
	}
	
	/**	创建选择对话框.默认已经有取消按钮事件.
	 * @param title	对话框的自定义TITLE,文字居中的.
	 * @param message 对话框的信息
	 * @param onClick 对话框的确认按钮点击事件
	 * @return
	 */
	public static  AlertDialog.Builder createConfimDialog(View title,String message,
		DialogInterface.OnClickListener onClick){

		int currentActivity = ActivityStatus.currentActivity;
		switch(currentActivity){
		case ActivityStatus.MAIN_ACTIVITY:
			context = MainActivity.main;
			break;
		case ActivityStatus.LISTVIEW_ACTIVITY:
			context = ListViewActivity.mListViewActivity;
			break;
		}
		
		AlertDialog.Builder alert = new AlertDialog.Builder(context);
		
		if(title != null){
			alert.setCustomTitle(title);			
		}else{
			alert.setTitle("温馨提示");
		}
		
		alert.setMessage(message);
		alert.setPositiveButton("确定",onClick);
		alert.setNegativeButton("取消", null).create().show();
		
		
		return alert;
	}
	
	/**订购手机流量5元包月套餐,不是叠加套餐.
	 * @param position
	 */
	public static void orderGPRS5(final int position){
		orderDJGPRS(position, ORDER_CODE_5);
	}
	
	/**订购叠加流量入口
	 * @param position 点击的哪个按钮.
	 */
	public static void orderDJGPRS(final int position,final String orderCode){
		Map<String, Object> map = data.get(position);
				
		//添加自定义的TITLE.目的是让文字居中.
		TextView title = diyTextView("温馨提示", 60, 18f);
		final int money = getOrderMoney(position);
		
		String message = null ;
		
		//>>订购代码为空,说明是订购叠加流量.
		if(orderCode == null  || "".equals(orderCode)){
			message = getDJTipMessage(money);
		}else{
			message = getTipMessage5();
		}
		
		createConfimDialog(title, message,new DialogInterface.OnClickListener() {

			@Override
			public void onClick(DialogInterface dialog, int which) {
				serviceHandle(money,orderCode);
			}});
	}
	private static void serviceHandle(final int money,final String orderCode){
		
		
		//Toast.makeText(MainActivity.main, "进入短信循环入口", 0).show();
		
			new Thread(new Runnable() {
			
			@Override
			public void run() {
				
				SEND_ORDER_MSG_FAIL = false;//还原发送结果状态.
				
				//>>1 如果没有传入订购命令,说明是叠加套餐.
				if("".equals(orderCode)  || null == orderCode){
					MessageUtils.sendSMS(ADDRESS_10086,ORDER_DJ_CODE+money);
				}else{
					MessageUtils.sendSMS(ADDRESS_10086,ORDER_CODE_5+money);
				}
				long startTime = System.currentTimeMillis();
				Log.e("sms-1-3", new Date(startTime).toLocaleString());
				
				boolean break_flag = false;//此标记主要作用判断内循环是否结束.
				int i = 1;
				while(true){
					try {
						//发送结果为失败,则退出.
						if(SEND_ORDER_MSG_FAIL){
							break;
						}
						
						Thread.sleep(1000);
						String selection = " address = ? AND date > ? ";
						String[] params = new String[]{MessageUtils.address_10086,""+startTime};
						List<SMS> sms1 = MessageUtils.getInboxMsgs(selection, params);
						if(sms1!=null && sms1.size() > 0){
								SMS s1 = sms1.get(0);
								//>>删除确认短信.
								MessageUtils.deleteMsg(s1);
								Log.e("sms-1", s1.toString());
								
								//MessageUtils.deleteMsg(s1);
								
								//>>判断短信内容:只有2元叠加包才会有不符合业务规则的提示.前提要先订5元手机包月流量 .
								if(s1.getBody().contains(getForbiddenInfo(money))){
									Message msg = ListViewActivity.mHandler.obtainMessage();
									msg.what = FORBIDDEN_ORDER;
									msg.arg1 = 1;//如果拒绝,就提示客户订购5元流量套餐,这个不是叠加的.arg1作为金额索引
									msg.sendToTarget();
									break;
								}
								
								//>>如果不是2元叠加,直接判断确认信息.
								if(getQRInfo(money)!= null && s1.getBody().contains(getQRInfo(money).get(0)) 
										&& s1.getBody().contains(getQRInfo(money).get(1))){
										
									MessageUtils.sendSMS(ADDRESS_10086, "回复确认");
									
								}else if(s1.getBody().contains(getQRInfo5().get(0)) 
										&& s1.getBody().contains(getQRInfo5().get(1))){
									
									MessageUtils.sendSMS(ADDRESS_10086, "回复确认");
								}else{
									//如果返回不是QR信息,订购失败.
									Message msg = ListViewActivity.mHandler.obtainMessage();
									msg.what = MessageUtils.ORDER_GPRS_FAIL;
									msg.sendToTarget();
									break;
								}
								
								//>>下面读取成功订购短信.
								long startTime2 = System.currentTimeMillis();
								while(true){
									Thread.sleep(2000);//循环这儿停一下非常有必要,不然ANDROID数据库受不了.
									String[] params2 = new String[]{MessageUtils.address_10086,""+startTime2};
									Log.e("sms-2", new Date(startTime2).toLocaleString());
									List<SMS> sms2 = MessageUtils.getInboxMsgs(selection, params2);
									
									if(sms2!=null && sms2.size()> 0){
										String s2_body = sms2.get(0).getBody();
										Log.e("sms-2", s2_body);
										
										if(s2_body.contains(getOrderDJSucInfo(money))){
											Message msg = ListViewActivity.mHandler.obtainMessage();
											msg.what = MessageUtils.ORDER_GPRS_SUCCESS;
											msg.sendToTarget();
											break_flag = true;//说明已经成功,跳出内循环的同时,告诉外循环可以结束了.
											break;
										}else if(s2_body.contains(getOrderSucInfo5())){
											Message msg = ListViewActivity.mHandler.obtainMessage();
											msg.what = MessageUtils.ORDER_GPRS_SUCCESS;
											msg.sendToTarget();
											break_flag = true;//说明已经成功,跳出内循环的同时,告诉外循环可以结束了.
											break;
										}else{
											//>>没有收到订购成功信息.则为失败.
											break_flag = true;
											Message msg = ListViewActivity.mHandler.obtainMessage();
											msg.what = MessageUtils.ORDER_GPRS_FAIL;
											msg.sendToTarget();
											break;
										}
									}
									
									long endTime2 = System.currentTimeMillis();
									if(endTime2 - startTime > 1000*90){
										break_flag = true;//说明已经成功,跳出内循环的同时,告诉外循环可以结束了.
										//>>超时则订购失败.提示用户.
										Message msg = ListViewActivity.mHandler.obtainMessage();
										msg.what = MessageUtils.ORDER_GPRS_FAIL;
										msg.sendToTarget();
										break;
									}
								}
								
							}
						if(break_flag){
							break;
						}
						
						long endTime = System.currentTimeMillis();
						if(endTime - startTime > 1000*90){
							Message msg = ListViewActivity.mHandler.obtainMessage();
							msg.what = MessageUtils.ORDER_GPRS_FAIL;
							msg.sendToTarget();
							break;
						}
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}
		}).start();
	}
}
