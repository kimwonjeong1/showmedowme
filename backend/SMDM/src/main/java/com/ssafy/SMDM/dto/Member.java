package com.ssafy.SMDM.dto;

import javax.persistence.*;

@Entity
public class Member {
    @Id
    private int mId;

    @OneToOne(cascade = CascadeType.ALL)
    private Salt salt;
}
