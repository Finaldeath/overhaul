//::///////////////////////////////////////////////
//:: Voleron Custom User Defined Event
//:: 2q4d_voleron_d
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the statues disapear in front of the tomb
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: May 9th, 2002
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();
    if(nUser == 1007) // DEATH
    {
        object oStatue = GetObjectByTag("2q4_tombstatue");
        if(GetIsObjectValid(oStatue))
        {
            if(GetPlotFlag(oStatue))
            {
                SetPlotFlag(oStatue, FALSE);
            }
            DestroyObject(oStatue);
        }
        object oVFX = GetObjectByTag("2q4_tombsparks");
        if(GetIsObjectValid(oVFX))
        {
            if(GetPlotFlag(oVFX))
            {
                SetPlotFlag(oVFX, FALSE);
            }
            DestroyObject(oVFX);
        }
    }
}

