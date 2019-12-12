package com.lxinet.jeesns.core.exception;


import com.lxinet.jeesns.core.enums.Messages;

/**
 * @author zchuanzhao
 */
public class OpeErrorException extends JeeException {

    public OpeErrorException(){
        super(Messages.ERROR);
    }

    public OpeErrorException(Messages message){
        super(message);
    }

    public OpeErrorException(String message){
        super(message);
    }
}
