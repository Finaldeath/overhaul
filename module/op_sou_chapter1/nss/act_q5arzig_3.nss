//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Arzig still alive and give's rod to Klumph
    Klumph runs to the jump pit...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 24/03
//:://////////////////////////////////////////////

#include "q5_inc_plot"
#include "nw_i0_plot"
void main()
{
    object oMaster = GetObjectByTag("Q5_KLUMPH");
    object oArzig = OBJECT_SELF;
    object oPC = GetPCSpeaker();
    //Destroy Arzig's rod of ruler and give one to the master jumper
    object oRodofRuler = GetItemPossessedBy(oArzig, "q5rodofruler");
    DestroyObject(oRodofRuler);
    object oNewRod = CreateItemOnObject("q5rodofruler", oMaster);
    SetDroppableFlag(oNewRod, TRUE);

    //SetPlot("jt_q5masterjump", 100, GetFirstPC());
    SetPlot("jt_q5blocked", 20, GetFirstPC());
    object oWP = GetWaypointByTag("Q5_WP_MASTER_JUMPER");
    AssignCommand(oMaster, ActionForceMoveToObject(oWP, TRUE));
    DelayCommand(1.0, SetCommandable(FALSE, oMaster));
    DelayCommand(30.0, SetCommandable(TRUE, oMaster));
    string sBaseTag = "Q5_WP_JUMPER";
    int i = 1;
    object oJumperWP;
    string sTag;
    for (i = 1; i <= 7; i++)
    {
        sTag = sBaseTag + IntToString(i);
        oJumperWP = GetWaypointByTag(sTag);
        CreateObject(OBJECT_TYPE_CREATURE, "q5_kobold_jumper", GetLocation(oJumperWP));
    }

    //Set all kobold factions neutral to the PC
    object oGuard = GetObjectByTag("Q5_KOBOLD_GUARD_FACTION");
    object oCommoner = GetObjectByTag("Q5_KOBOLD_COMMONER_FACTION");

    AdjustFactionReputation(oPC, oGuard, 50);
    AdjustFactionReputation(oPC, oCommoner, 50);

    SetLocalInt(GetModule(),"X1_Q5CHAMPION",10);
    SetLocalInt(GetModule(),"X1_Q5CHIEFDONE",10);
}
