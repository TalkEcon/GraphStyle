library(ggplot2)
library(ggthemes)
library(reshape2)
library(svglite)
setwd("~/Downloads/TalkEcon_Graph") #請設為自己電腦的路徑
#--------------------------------------------------------------------------
rice = read.csv("input/rice_price.csv", header = TRUE) 
rice$year[rice$year == 1] <- "1898–1902"
rice$year[rice$year == 2] <- "1909–1912"
rice$year <- as.factor(rice$year)
colnames(rice) <- c("地區","價格","平均米價")

positions <- c("台北", "宜蘭", "基隆", "桃園", "新竹", "苗栗", "葫蘆墩", "台中", "沙鹿", "彰化", "鹿港", "員林", "北斗", "草鞋墩", "嘉義", "斗六", "台南", "打狗", "阿緱", "東港", "恆春")
rice_price <- ggplot(rice, aes(x=地區, y=價格, fill=平均米價)) + 
  geom_bar(stat="identity", position="dodge") +
  scale_x_discrete(limits = positions) + #讓x軸地區依照原本csv的順序從北到南排
  scale_y_continuous(expand = c(0, 0)) + #讓y軸從0開始
  theme_wsj(base_size = 12, base_family = "Source Han Sans Normal", title_family = "Source Han Sans") + #控制基本字體大小與字型
  scale_colour_wsj("colors6") + #作用不確定，好像也沒有別的選項
  theme(text = element_text(size=12), #控制基本字體大小
        legend.title = element_text(size=13, face = "bold"), #控制圖例標題字體大小
        axis.line.x = element_line(size=0.5, color = "black"), #控制x軸粗細與顏色
        axis.title = element_blank(), #不顯示xy軸標題
        axis.title.x = element_blank(), #不顯示x軸標題
        axis.ticks.x = element_blank(),  #不顯示x軸刻度
        axis.text.x = element_text(size=7), #控制x軸內容字體大小
        axis.text.y = element_text(size=10)) + #控制y軸內容字體大小
  labs(fill="台灣各地平均米價 (圓/石)") #控制圖例標題名稱
rice_price
ggsave("output/rice_price.svg", width=8, height=4.5)

#--------------------------------------------------------------------------
Export = read.csv("input/export_ratio.csv", header = TRUE)
Export$Export <- NULL
Export <- melt(Export,id=c("year"))
exd <- matrix(NA,30,3)
colnames(Export) <- c("年度","出口國別","佔出口總量比例")

Export$出口國別 <- as.character(Export$出口國別)
Export_gph <- ggplot(Export, aes(x=年度, y=佔出口總量比例, color=出口國別)) + 
  geom_line(stat="identity",position=position_dodge(width=0.9), size=2) + #控制線條
  theme_wsj(base_size = 13, base_family = "Source Han Sans Normal", title_family = "Source Han Sans") + #控制基本字體大小與字型
  scale_colour_wsj("colors6") + #作用不確定，好像也沒有別的選項
  theme(text = element_text(size=13), #控制基本字體大小
        legend.title = element_text(size=14, face = "bold"), #控制圖例標題字體大小
        axis.line.x = element_line(size=0.5, color = "black"), #控制x軸粗細與顏色
        axis.title = element_blank()) + #不顯示xy軸標題
  labs(color="台灣對各國出口占總出口比例 (%)") + #控制圖例標題名稱
  scale_y_continuous(expand=c(0,0), limits=c(0,50), breaks=c(0, 10, 20, 30, 40, 50)) + #控制y軸刻度
  scale_x_continuous(breaks=c(2000,2004,2008,2012,2015)) #控制x軸刻度
Export_gph
ggsave("output/export_gph.svg", width=8, height=4.5)

#--------------------------------------------------------------------------
export_world = read.csv("input/export_world.csv", header=TRUE) # dim = 255 54
exw <- matrix(NA,255*53,3)
colnames(exw)=c("country","year","percentage")
exw <- data.frame(exw)
for (i in 1:255){
  exw[ ( (i - 1) * 53 + 1): ((i - 1) * 53 + 53 ),1] <- as.character(export_world[i,1])
  exw[ ( (i - 1) * 53 + 1): ((i - 1) * 53 + 53 ),2] <- seq(1960,2012)
  for (j in 1:53){
    exw[((i - 1) * 53 + j),3] <- export_world[i,j+1]
  }
}
subset(exw,country=="Taiwan (World Bank)")
subset(exw,country=="World")
exwdata <- rbind(subset(exw,country=="World"),subset(exw,country=="Taiwan (World Bank)"))
colnames(exwdata) <- c("國家","年度","出口佔GDP比例")

exwdata[exwdata[,1]=="World",][,1] <- "世界平均"
exwdata[exwdata[,1]=="Taiwan (World Bank)",][,1] <- "台灣"
third_gph <- ggplot(data=exwdata,aes(x=年度,y=出口佔GDP比例,color=國家)) + 
  geom_line(stat="identity",position=position_dodge(width=0.9), size=2) +  #控制線條
  theme_wsj(base_size = 13, base_family = "Source Han Sans Normal", title_family = "Source Han Sans") +  #控制基本字體大小與字型
  scale_colour_wsj("colors6") + #作用不確定，好像也沒有別的選項
  theme(text = element_text(size=13), #控制基本字體大小
        legend.title = element_text(size=14, face = "bold"),  #控制圖例標題字體大小
        axis.title = element_blank(), #不顯示xy軸標題
        axis.line.x = element_line(size=0.5, color = "black")) +  #控制x軸粗細與顏色
  labs(color="出口佔 GDP 比例 (%)") +  #控制圖例標題名稱
  scale_y_continuous(expand=c(0,0), limits=c(0,80)) + #控制y軸刻度
third_gph
ggsave("output/third_gph.svg", width=8, height=4.5)
