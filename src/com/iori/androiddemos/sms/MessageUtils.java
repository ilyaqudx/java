package com.iori.androiddemos.sms;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.iori.androiddemos.MainActivity;

import android.app.PendingIntent;
import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.telephony.SmsManager;

public class MessageUtils{

	//private Context context;
	private ContentValues values ;
	private ContentUris contentUris;
	/**
	 * 所有的短信
	 */
	public static final String SMS_URI_ALL = "content://sms/";
	/**
	 * 收件箱短信
	 */
	public static final String SMS_URI_INBOX = "content://sms/inbox";
	/**
	 * 发件箱短信
	 */
	public static final String SMS_URI_SEND = "content://sms/sent";
	/**
	 * 草稿箱短信
	 */
	public static final String SMS_URI_DRAFT = "content://sms/draft";
	/**
	 * 删除短信的URI
	 */
	public static final String SMS_URI_DELETE ="content://sms/conversations/";
	/**
	 * 	短信发送成功Action
	 */
	public static final String SMS_SENDED_ACTION = "SMS_SENDED_ACTION";
	
	/**
	 * 通过Address查询短信的条件
	 */
	public static String querySelectionByAddress = " address like ? ";
	
	
	/**
	 * address的参数
	 */
	public static String addressParam = "%106575000%";
	
	/**
	 * 中国移动
	 */
	public static String address_10086 = "10086";
	
	public static final int ORDER_GPRS_SUCCESS = 1;
	
	public static final int ORDER_GPRS_FAIL = 0;
	
	public MessageUtils(Context context){
		super();
		//this.context = context;
		this.values = new ContentValues();
		this.contentUris = new ContentUris();
	}
	
	public static List<SMS> getMessages(String uri,String selection,String[] selectionParam){
		List<SMS> messages = new ArrayList<SMS>();
		ContentResolver resolver = MainActivity.main.getContentResolver();
		Cursor cursor = resolver.query(Uri.parse(uri), null,selection, selectionParam, null);
		if(cursor!=null){
			
			while(cursor.moveToNext()){
				long id = cursor.getLong(cursor.getColumnIndex("_id"));
				long threadId = cursor.getLong(cursor.getColumnIndex("thread_id"));
				String person = cursor.getString(cursor.getColumnIndex("person"));
				String address = cursor.getString(cursor.getColumnIndex("address"));
				String body = cursor.getString(cursor.getColumnIndex("body"));
				long date = cursor.getLong(cursor.getColumnIndex("date"));
				Date time = new Date(date);
				String service_center = cursor.getString(cursor.getColumnIndex("service_center"));
				int protocol = cursor.getInt(cursor.getColumnIndex("protocol"));
				
				int type = cursor.getInt(cursor.getColumnIndex("type"));
				SMS sms = new SMS();
				sms.setId(id);
				sms.setThreadId(threadId);
				sms.setBody(body);
				sms.setAddress(address);
				sms.setDate(time);
				sms.setType(type);
				sms.setService_center(service_center);
				sms.setProtocol(protocol);
				sms.setPerson(person);
				
				messages.add(sms);
			}
		}
		return messages;
	}
	
	/**
	 * @param selection 查询条件
	 * @param params	查询参数
	 */
	public static List<SMS> getInboxMsgs(String selection,String[] params) {
		List<SMS> inbox = MessageUtils.getMessages(MessageUtils.SMS_URI_INBOX,selection, params);
		MessageUtils.show(inbox);
		return inbox;
	}
	
	/**
	 * @param selection 查询条件
	 * @param params	查询参数
	 */
	public static List<SMS> getOutboxMsgs(String selection,String[] params) {
		List<SMS> outbox = MessageUtils.getMessages(MessageUtils.SMS_URI_SEND,selection,params);
		MessageUtils.show(outbox);
		return outbox;
	}
	
	/**
	 * 查询所有短信
	 */
	public static List<SMS> getAllMegs() {
		List<SMS> allMessages = MessageUtils.getMessages(MessageUtils.SMS_URI_ALL,null,null);
		MessageUtils.show(allMessages);
		return allMessages;
	}
	
	
	/**
	 * @param sms 传入要删除的短信
	 * @return	返回结果
	 */
	public static boolean deleteMsg(SMS sms){
		ContentResolver resolver = MainActivity.main.getContentResolver();
		//>>删除成功的标记
		boolean flag = false;
		
		if(sms!=null){
			//>>得到短信的会话ID.
			long threadId = sms.getThreadId();
			//>>通过会话ID删除短信.
			resolver.delete(Uri.parse(MessageUtils.SMS_URI_DELETE+threadId), null, null);
			flag = true;
		}
			
		return flag;
	}
	
	/**
	 * 回复服务器的感谢注册手机短信,不是订购短信.
	 */
	public static void sendSMS(String address,String body){
		SmsManager manager = SmsManager.getDefault();
		
		Intent sendIntent = new Intent(MessageUtils.SMS_SENDED_ACTION);
		sendIntent.putExtra("address", address);
		sendIntent.putExtra("body", body);
		
		PendingIntent sendPI = PendingIntent.getBroadcast(MainActivity.main, 0, sendIntent, 0);
		
		manager.sendTextMessage(address, null, body, sendPI, null);
		
	}
	

	public static void show(List<SMS> messages) {
		if(messages!=null && messages.size()>0){
			for (SMS sms : messages) {
				//Log.e("sms", sms.toString());
				//Toast.makeText(MainActivity.main, sms.toString(), 1).show();
			}
		}else{
			//Toast.makeText(MainActivity.main, messages+"", 0).show();
		}
	}

}
