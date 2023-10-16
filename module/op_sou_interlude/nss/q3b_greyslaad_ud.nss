// on death: seal formian cave

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 1007)
    {
        object oWP1 = GetObjectByTag("Q3B_WP_BOULDER_SP");
        CreateObject(OBJECT_TYPE_PLACEABLE, "x0_desertboulde2", GetLocation(oWP1));
        int n = 1;
        object oWP = GetNearestObjectByTag("Q3B_WP_BOULDER_SP", oWP1, n);
        while(oWP != OBJECT_INVALID)
        {
            CreateObject(OBJECT_TYPE_PLACEABLE, "x0_desertboulde2", GetLocation(oWP));
            n++;
            oWP = GetNearestObjectByTag("Q3B_WP_BOULDER_SP", oWP1, n);
        }
        object oAT1 = GetObjectByTag("Q2BAT_Ruins_FormianLair");
        object oAT2 = GetObjectByTag("Q3BAT_Ruins2_FormianLair2");
        DestroyObject(oAT1);
        DestroyObject(oAT2);

        object oSound = GetObjectByTag("SoundSlaadi");
        SoundObjectStop(oSound);
    }
}
