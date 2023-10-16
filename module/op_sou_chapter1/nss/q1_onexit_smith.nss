//q1_onexit_smith
void main()
{
    object oPC = GetExitingObject();
    if (GetLocalInt(oPC, "X1_nSmithHelmWait") == 1)
        SetLocalInt(oPC, "X1_nSmithHelmWait", 2);
}
