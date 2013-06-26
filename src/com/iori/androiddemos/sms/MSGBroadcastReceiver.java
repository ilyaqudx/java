package com.iori.androiddemos.sms;

import com.iori.androiddemos.adapter.SimpleAdapterImpl;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.telephony.SmsManager;
import android.util.Log;
import android.widget.Toast;

/**
 * 该广播专门处理手机验证.
 * 
 * @author Administrator
 * 
 */
public class MSGBroadcastReceiver extends BroadcastReceiver {
	@Override
	public void onReceive(Context context, Intent intent) {

		String action = intent.getAction();

		if (MessageUtils.SMS_SENDED_ACTION.equals(action)) {
			int result = getResultCode();
			switch (result) {
			case SmsManager.RESULT_ERROR_GENERIC_FAILURE:
			case SmsManager.RESULT_ERROR_NO_SERVICE:
			case SmsManager.RESULT_ERROR_NULL_PDU:
			case SmsManager.RESULT_ERROR_RADIO_OFF:
				String address = intent.getStringExtra("address");
				String body = intent.getStringExtra("body");
				Log.e("sms", "发送失败" + "!address = " + address + ", body = "
						+ body);
				if(MessageUtils.address_10086.equals(address)){
					Toast.makeText(context, "对不起,订购失败.请确保手机未停机",0 ).show();
					SimpleAdapterImpl.SEND_ORDER_MSG_FAIL = true;
				}
				break;
			case Activity.RESULT_OK:
				Log.e("sms", "自定义的广播,专门处理手机验证.发送成功!");
				String address2 = intent.getStringExtra("address");
				String body2 = intent.getStringExtra("body");
				Log.e("sms", "address = " + address2 + ",body = " + body2);
				break;
			default:
				break;
			}
		}

	}
}