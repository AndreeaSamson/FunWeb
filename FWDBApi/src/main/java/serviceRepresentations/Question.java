package serviceRepresentations;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * POJO for a game question.
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Question {
    public Long id;
    public String enunciation;
    public Long reward;
    public Long characterId;
    public Long chapterId;
}
