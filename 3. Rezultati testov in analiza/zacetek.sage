#!/usr/bin/env python
# coding: utf-8

edges = [(0,1,15),(0,2,13),(2,1,4)]
G = Graph(edges, weighted = True)
G.show(edge_labels=True)



H = DiGraph({1: {1: 2}, 2: {1: 4}, 3:{1:4}}, weighted=True, sparse=True)
H.laplacian_matrix()
plot(H)











