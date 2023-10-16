int StartingConditional()
{
  int bCondition =  GetIsPC(GetPCSpeaker()) == FALSE &&
                    GetLocalInt(OBJECT_SELF,"L_TALKTIMES")  == 2 &&
                    GetIsObjectValid(GetAttemptedAttackTarget()) == FALSE;
  return bCondition;
}
