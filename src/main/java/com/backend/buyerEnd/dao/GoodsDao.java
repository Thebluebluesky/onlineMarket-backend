package main.java.com.backend.buyerEnd.dao;

import main.java.com.backend.buyerEnd.model.Goods;
import java.util.List;

public interface GoodsDao {
    public List<Goods> listGoods();
    public Goods getGoodsByGoodsId(String goodsId);
    public void removeGoods(String goodsId);
}
