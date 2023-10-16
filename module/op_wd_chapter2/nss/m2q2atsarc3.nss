void main()
{
int nNum;

nNum = GetLocalInt(OBJECT_SELF,"M2Q2SarcophagusOrder") + 1;
SetLocalInt(OBJECT_SELF,"M2Q2SarcophagusOrder",nNum);
SetLocalInt(OBJECT_SELF,"M2Q2SarcophagusChoice",4);

}

