package com.iori.androiddemos;

import com.iori.androiddemos.utils.ActivityStatus;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends Activity implements OnClickListener {

	private Button listView;
	private Button scrollView;
	private Button intent;
	public static Activity main;
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		main = MainActivity.this;
		
		initView();
	}
	
	
	private void initView(){
		this.listView = (Button) this.findViewById(R.id.ListView);
		this.scrollView = (Button) this.findViewById(R.id.ScrollView);
		this.intent = (Button) this.findViewById(R.id.Intent);
		
		listView.setOnClickListener(this);
		scrollView.setOnClickListener(this);
		intent.setOnClickListener(this);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}
	
	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		
		switch(keyCode){
			case KeyEvent.KEYCODE_BACK:
				AlertDialog.Builder alert = new Builder(this);
				alert.setIcon(R.drawable.p1);
				alert.setTitle("退出");
				alert.setMessage("您确定要退出嘛?");
				alert.setPositiveButton("确定", new DialogInterface.OnClickListener() {
					
					@Override
					public void onClick(DialogInterface dialog, int which) {
						main.finish();
					}
				});
				alert.setNegativeButton("取消", null).show();
				
				break;
		}		
		return true;
	}
	
	
	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		
		switch(requestCode){
		case ActivityStatus.MAIN_ACTIVITY:
			ActivityStatus.currentActivity = ActivityStatus.MAIN_ACTIVITY ;
			break;
		case ActivityStatus.LISTVIEW_ACTIVITY:
			ActivityStatus.currentActivity = ActivityStatus.LISTVIEW_ACTIVITY;
		}
	}


	@Override
	public void onClick(View v) {
		
		Intent intent = new Intent();
		
		int id = v.getId();
		switch (id) {
		case R.id.ListView:
			Toast.makeText(main, "弹出ListView", 0).show();
			
			intent.setClass(this, ListViewActivity.class);
			intent.putExtra("body", listView.getText().toString());
			
			this.startActivityForResult(intent, ActivityStatus.MAIN_ACTIVITY);
			ActivityStatus.currentActivity = ActivityStatus.LISTVIEW_ACTIVITY;
			
			break;
		case R.id.ScrollView:
			Toast.makeText(this, "弹出ScrollView", 0).show();
			break;
		case R.id.Intent:
			Toast.makeText(this	,"弹出Intent",0).show();
			break;
		default:
			break;
		}
	}

}
