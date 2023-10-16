/////This script will check if Lodar, Zed, Vanda, Rolgan, Neurik, Igland, Edegard, Jevon, Dalcia, Averik or Palla is dead
////If anyone of them is dead, set the NW_G_M3Q01PLOTTRIALDEAD global to 99 on their death



int ObjectValid(string sTag)
{
    if (GetIsObjectValid(GetObjectByTag(sTag)) == FALSE)
    {
        SpeakString("invalid " + sTag);
    }
    return  GetIsObjectValid(GetObjectByTag(sTag));
}


int StartingConditional()
{
    int l_iResult;

    if (
        (ObjectValid("MQ3JUROR4") == FALSE )    ||
        (ObjectValid("MQ3JUROR1") == FALSE )    ||
        (ObjectValid("MQ3JUROR2") == FALSE )    ||
        (ObjectValid("Merc13Q11") == FALSE )    ||
        (ObjectValid("MQ3JUROR5") == FALSE )    ||
        (ObjectValid("UthgardtWi3Q11") == FALSE )   ||
        (ObjectValid("Merc23Q11") == FALSE)    ||
        (ObjectValid("Neurik3Q11")  == FALSE )  ||
        (ObjectValid("Rolgan3Q11")  == FALSE )

       )
    {
        SetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALDEAD",99);
        SpeakString("onehasdied");
    }


    l_iResult = GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALDEAD") == 99;
    return l_iResult;
}
