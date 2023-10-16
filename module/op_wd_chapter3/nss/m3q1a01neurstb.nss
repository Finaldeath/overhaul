//::///////////////////////////////////////////////
//:: Allow Start Trial Response
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

      iResult =( (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS") == 0)
        &&  (  GetLocalInt(GetPCSpeaker(),"TrialAccepted") ==1));

     return iResult;
}
