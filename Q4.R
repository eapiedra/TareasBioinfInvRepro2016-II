## Cargar librerias
library(ggplot2)
library(ggtree)
library(ape)
library(phytools)

## Seleccionar wd
setwd("/Users/Arias/Desktop/BEAST_OUT/")

## Cargar un arbol, en este caso un ouput de BEAST
tree <- read.beast("Concatenate_BEAST.tree")

## Visualizar el ??rbol
ggtree(tree)

## Ver clase del objeto "tree"
class(tree)

## Ordenar los nodos
ggtree(tree, ladderize=TRUE)

## Agregar los tips
ggtree(tree, ladderize=TRUE) + geom_text(aes(label=label), size=2, hjust= 0)

## Agregar escala
ggtree(tree, ladderize=TRUE) + geom_text(aes(label=label), size=2, hjust= 0) +
      theme_tree2() 


## Agregar escala de color por longitud de rama
p<-ggtree(tree, ladderize=TRUE, aes(color=branch.length), ndigits = 2) +
   geom_text(aes(label=label), color="black", size=2, hjust= 0) + theme_tree2() +
   scale_color_continuous(low="green", high="red") +
   theme(legend.position="bottom")
p

#### Anotar el arbol

## Anotar el numero de nodo
p +  geom_text(aes(label=node), vjust=-.5, hjust=1, size=2, color="black")

## Anotar el clado de interes
p<- ggtree(tree, ladderize=TRUE, aes(color=branch.length), ndigits = 2) +
    theme_tree2() + scale_color_continuous(low="green", high="red") +
    theme(legend.position="bottom") +
    geom_cladelabel(node=115, label="C. stejnegerianus", fontsize=3) +
      geom_cladelabel(node=125, label="C. rearki", fontsize=3) +
      geom_cladelabel(node=133, label="C. gabbi sp. nov.", fontsize=3) +
      geom_cladelabel(node=135, label="C. persimilis", fontsize=3) +
      geom_cladelabel(node=95, label="Craugastor sp. nov. A", fontsize=3) +
      geom_cladelabel(node=92, label="C. bransfordii", fontsize=3) +
      geom_cladelabel(node=106, label="C. 'polyptychus'", fontsize=3) +
      geom_cladelabel(node=110, label="C. underwoodi", fontsize=3) +
      geom_cladelabel(node=86, label="C. 'podiciferus'", fontsize=3) +
      geom_cladelabel(node=138, label="Craugastor sp. nov. C", fontsize=3) +
      geom_cladelabel(node=146, label="Craugastor sp. nov. D", fontsize=3)
p

## Agregar age
p<-p + geom_text(aes(label=height), color="black", vjust=-.5, hjust=1, size=3) + theme_tree2() +
  scale_color_continuous(low="green", high="red") + theme(legend.position="bottom")
p

