package dao;

import dto.QuestionDto;
import util.ormapper.HinaOrmapper;

public class QuestionDao {

    private HinaOrmapper ho = null;

    public QuestionDao(HinaOrmapper ho) {
        this.ho = ho;
    }

    public QuestionDto getQuestionById(int id){

        String sql = null;

        return ho.excecuteQueryOne(sql, QuestionDto.class, String.valueOf(id));

    }

}
