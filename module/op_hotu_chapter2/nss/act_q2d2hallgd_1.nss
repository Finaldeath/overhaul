//::///////////////////////////////////////////////
//:: Name act_q2d2hallgd_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Hall guard takes the PCs helmet from him.
    Ok - to go into grand hall now.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 31/03
//:://////////////////////////////////////////////

void main()
{
    //Variable so the Brain knows to give back a helmet
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "X2_Q2DGaveHelm", 1);

    if (GetLocalInt(GetModule(),"elder_brain")<=1)
    {
        SetLocalInt(GetModule(),"elder_brain",1);
    }

    //Destroy the PCs helmet and give to the guard...
    object oItem = GetLocalObject(OBJECT_SELF, "oHelmet");
    DestroyObject(oItem);
    object oHelm = CreateItemOnObject("q2dmentalshield");
    SetDroppableFlag(oHelm, TRUE);

    SetLocalInt(GetModule(), "X2_Q2DPCClearedForHall", 1);
}
