# Graph Style

## Usage

1. Download and unzip [TalkEcon_Graph.zip](https://github.com/TalkEcon/GraphStyle/blob/master/TalkEcon_Graph.zip?raw=true).
2. Install [Source Han Sans (思源黑體)](https://github.com/adobe-fonts/source-han-sans/tree/release) if it is not installed in your computer.
3. Make sure to install all the needed packages in R.

    ```
    install.packages("ggplot2", dependencies = TRUE)
    install.packages("ggthemes", dependencies = TRUE)
    install.packages("reshape2", dependencies = TRUE)
    install.packages("svglite", dependencies = TRUE)
    ```

4. Open `graph.R`
    1. Change the working directory using `setwd` if needed.
    2. Change the font `Source Han Sans Normal` to one you would like to use if you did not install `Source Han Sans` (not recommended).
    3. Execute it.
5. Check if the outputs are consistent with the following graphs. 

    1. `rice_price.svg`
    
        <div>
        <img src="https://rawgit.com/TalkEcon/GraphStyle/master/TalkEcon_Graph/output/rice_price.svg" width="700">
        </div>
    
    2. `export_gph.svg`
    
        <div>
        <img src="https://rawgit.com/TalkEcon/GraphStyle/master/TalkEcon_Graph/output/export_gph.svg" width="700">
        </div>
    
    3. `third_gph.svg`
    
        <div>
        <img src="https://rawgit.com/TalkEcon/GraphStyle/master/TalkEcon_Graph/output/third_gph.svg" width="700">
        </div>
