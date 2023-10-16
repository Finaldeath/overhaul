// sets "male" or "female" in drow, based on the PC's sex

void main()
{
    object oPC = GetPCSpeaker();
    int nSex = GetGender(oPC);
    if (nSex == GENDER_FEMALE)
    {
        SetCustomToken(5002, GetStringByStrRef(110618));
        //SetCustomToken(5002, "jalil");
    }
    else SetCustomToken(5002, GetStringByStrRef(110619));
    //else SetCustomToken(5002, "jaluk");

    SetLocalInt(oPC, "nTalkingToDreamMatron", 1);
}
