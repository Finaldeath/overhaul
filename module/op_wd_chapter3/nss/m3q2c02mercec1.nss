//::///////////////////////////////////////////////
//:: Merchants active Uthgardt encounter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////


void main()
{
    object oAmbush= GetNearestObjectByTag("M3Q2CMERCHANTAMB");
    SetLocalInt(GetObjectByTag("ScaredMerc3Q21"),"NW_L_TALKTIMES",GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") + 1);
    SetLocalInt(GetObjectByTag("SCAREDMERC3Q022"),"NW_L_TALKTIMES",GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") + 1);
    SetEncounterActive(TRUE, oAmbush);
}
