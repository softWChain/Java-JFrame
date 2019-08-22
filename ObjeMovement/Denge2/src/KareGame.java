import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Random;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.Timer;



public class KareGame extends JPanel implements ActionListener {
	
	 int x, y ;
	 
	 
	 private int uzunluk=10;
	 int[] xarr = new int[10];
	 int[] yarr = new int[10];
	 int ts = -1;
	 
	 Random random = new Random();
	
	public KareGame(){
		super();
		setSize(new Dimension(500,400));
		setPreferredSize(new Dimension(500,400));
		setFocusable(true);
		//Denge();
		
		Timer zaman = new Timer(20,this);
		zaman.start();
		
		
		

	
	}
	
	public void Denge(){

		  for(int i=1;i<uzunluk;i++){
			  x=300;
			  x = random.nextInt(300)+50;
			  y = random.nextInt(1);

			  x=x+30;
			  xarr[i] = x;
			  yarr[i] = y;
			  
			  
		  }
	
	}
	
	public void paint(Graphics g){
		
		super.paint(g);
		g.setColor(Color.BLACK);
		g.fillRect(0, 0, getWidth(), getHeight());
		
	
		 for ( int i = 0 ; i < uzunluk ; i++) {
			   
				g.setColor(Color.ORANGE);
			    g.fillRect(xarr[i], yarr[i], 30, 20);
			   
			  }
	
		  
		  for(int i=0;i<10;i++){
			  
			  System.out.println(xarr[i] + " " + yarr[i]);
		  }
		
	
		  
	 }
		

	
	public static void main(String[] args) {
		
		JFrame frame = new JFrame();
		KareGame kare = new KareGame();
		
		frame.setTitle("VeysBULUT");
		frame.setSize(new Dimension(500,400));
		frame.add(kare);
		frame.setResizable(false);
		frame.pack();
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // Programý biz kapatsak bile arka planda çalýþmaya devam edicek.
		frame.setLocationRelativeTo(null);
		frame.setVisible(true);
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		
		
		int t=0;
		  for ( int i = 0 ; i < uzunluk ; i++) {
			  t=t+1;
			  xarr[i]=xarr[i]+1;
			  yarr[i]=yarr[i]+1;
			  }
		  
		  if(t==20){
			  
			  
		  }
		
		
		

		  repaint();
			
		
	}

}
