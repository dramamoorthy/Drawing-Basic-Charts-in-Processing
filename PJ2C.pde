Table tabularData = null;

void setup() {
  size(600, 600);
  selectInput("Select a file to process:", "fileSelected");
}

void draw() {
  if(tabularData == null){
    background(255);
  }
  else
  {
    stroke(0);
    fill (0);
    text("VOTE PERCENTILE FOR YEARS FROM 1992 TO 2016", 10,10);
    text("YEARS",110,28);
    text("VOTE %",0,75);
    drawMultiVariate();
    
    noLoop();
  }
  
  
}

void drawMultiVariate(){
  int i=0;
  int year,value0, value_prev=-99;
  stroke(0);
    fill (255, 153, 0);
  for(TableRow row : tabularData.rows()){
     year = row.getInt("YEAR");
     value0 = row.getInt("VALUE0");
     if(value_prev == -99){
       value_prev = value0;
     }
     
     rect(i*20 + 50, 30, 20, 10*value0);
     if(i>0){ //<>//
       line((50+ ((20*(i-1)) + 10)), (30+ (10*value_prev)), (50 + (20*i + 10)), (30+(10*value0)));
       value_prev = value0;
     }
     i++;
  }
}

void fileSelected(File selection) {
  if (selection == null) {
    
  } else {
        tabularData = loadTable(selection.getAbsolutePath(), "header");
  }
}