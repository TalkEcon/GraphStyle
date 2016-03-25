# Graph Style

## Usage

1. Download and unzip [TalkEcon_Graph.zip](https://github.com/TalkEcon/GraphStyle/blob/master/TalkEcon_Graph.zip?raw=true).
2. Make sure to install all the needed packages in R.

    ```
    install.packages("ggplot2", dependencies = TRUE)
    install.packages("ggthemes", dependencies = TRUE)
    install.packages("reshape2", dependencies = TRUE)
    install.packages("svglite", dependencies = TRUE)
    ```

3. Open `graph.R`, change the working directory using `setwd` if needed, and execute it.
4. Check if the outputs are consistent with the following graphs. 

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
