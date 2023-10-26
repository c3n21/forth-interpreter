package it.unimi.di.sweng.lab03;

import static org.assertj.core.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Timeout;
import org.junit.jupiter.params.ParameterizedTest;



@Timeout(2)
public class ForthInterpreterTest {
  private Interpreter interpreter;

  @BeforeEach
  public void setUp() {
    interpreter = new ForthInterpreter();
  }

}
