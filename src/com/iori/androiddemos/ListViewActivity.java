package com.iori.androiddemos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.app.Activity;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.iori.androiddemos.adapter.SimpleAdapterImpl;
import com.iori.androiddemos.sms.MessageUtils;

public class ListViewActivity extends Activity{

	
	private ListView listView;
	private ListAdapter adapter;
	private List<Map<String, Object>> data;
	public static ListViewActivity mListViewActivity ;
	
	public static Handler mHandler = new Handler(){
		@Override
		public void handleMessage(Message msg) {
			int what = msg.what;
			switch(what){
				case MessageUtils.ORDER_GPRS_SUCCESS:
					Toast.makeText(MainActivity.main, "恭喜您,已经订购成功!可以立即使用.",1).show();
					Log.e("sms", "次线程发送:订购成功消息到HANDLER.");
					mListViewActivity.finish();
					break;
				case SimpleAdapterImpl.FORBIDDEN_ORDER:
					int moneyIndex = msg.arg1;//这个是5元手机流量对应的索引.
					SimpleAdapterImpl.orderGPRS5(moneyIndex);//如果用这个方法,要传入金额所对应的索引
					break;
				case MessageUtils.ORDER_GPRS_FAIL:
					Toast.makeText(MainActivity.main, "对不起,您不符合开通条件!",1).show();
					break;
				default:
					break;
			}
		}
	};
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		
		super.onCreate(savedInstanceState);
		setContentView(R.layout.listview);
		mListViewActivity = this;
		this.listView = (ListView) this.findViewById(R.id.listView_hasBody);
		initListView();
		listView.setAdapter(adapter);
	}
	
	private boolean initListView(){
		try {
			data = new ArrayList<Map<String,Object>>();
			initMap(data);//给LISTVIEW添加数据.
			int resource = R.layout.listview_item_bak;
			String[] from = new String[]{"gprs","mimi","btn"};
			int[] to = new int[]{R.id.body_gprs,R.id.body_mimi,R.id.order_btn};
			this.adapter = new SimpleAdapterImpl(this, data, resource, from, to);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	private void initMap(List list){
		for (int i = 0; i < 7; i++) {
			Map<String , Object> map = new HashMap<String, Object>();
			map.put("gprs", "移动流量叠加5元套餐"+i);
			map.put("mimi", "获得30M赠送50000米米");
			map.put("btn", "订购");
			list.add(map);
		}
	}
}
