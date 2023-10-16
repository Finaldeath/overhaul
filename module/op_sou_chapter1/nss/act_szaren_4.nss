//PC on Red Wizard Quest
void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC,"X1_SZARENASKED",GetLocalInt(oPC, "X1_SZARENASKED")+1);
}

