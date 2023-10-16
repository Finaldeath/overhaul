//::///////////////////////////////////////////////
//:: q2a_maeviirend
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  End dialog script for inside the Maeviir house
  Makes everyone go hostile or teleports everyone out
*/
//:://////////////////////////////////////////////
#include "nw_i0_generic"
#include "nw_i0_plot"

void CallForHelp(object oMatron);

void main()
{
    if (GetLocalInt(GetModule(),"Zesyyr_Rule")==TRUE ||
        GetLocalInt(GetModule(),"Zesyyr_Betray")==FALSE)
    {
        SetLocalInt(GetModule(),"Zesyyr_Betray",FALSE);
        SetLocalInt(GetModule(),"Zesyyr_Rule",TRUE);
        ///Make everyone go hostile
        //After the battle fade to black and have
        //Zesyyr and her guards come in in cutscene

        //only 2 guards fight with the matron
        object oMatron = GetObjectByTag("q2amaematron");
        object oTebomir = GetObjectByTag("q2amaecapt");
        object oGuard1 = GetObjectByTag("cut108_guard5");
        object oGuard2 = GetObjectByTag("cut108_guard6");

        //Set Variable on the Matron so if she dies we know to run the
        //Zesyyr cutscene
        SetLocalInt(oMatron, "X2_RunZesPlotCutscene", 1);
        SetLocalInt(oTebomir, "X2_RunZesPlotCutscene", 1);
        ChangeToStandardFaction(oMatron, STANDARD_FACTION_HOSTILE);
        ChangeToStandardFaction(oTebomir, STANDARD_FACTION_HOSTILE);
        ChangeToStandardFaction(oGuard1, STANDARD_FACTION_HOSTILE);
        ChangeToStandardFaction(oGuard2, STANDARD_FACTION_HOSTILE);

        SetPlotFlag(oMatron, FALSE);
        SetPlotFlag(oTebomir, FALSE);
        SetPlotFlag(oGuard1, FALSE);
        SetPlotFlag(oGuard2, FALSE);

        DelayCommand(0.5, AssignCommand(oMatron, DetermineCombatRound()));
        DelayCommand(0.5, AssignCommand(oTebomir, DetermineCombatRound()));
        DelayCommand(0.5, AssignCommand(oGuard1, DetermineCombatRound()));
        DelayCommand(0.5, AssignCommand(oGuard2, DetermineCombatRound()));

        DelayCommand(12.0, CallForHelp(oMatron));
    }


    if (GetLocalInt(GetModule(),"Zesyyr_Betray")== TRUE)
    {
     //Remove Zesyyr and her personal guards from the city
     //Add heads on stakes in city
     //Teleport the party back outside the tower
        object oPC = GetPCSpeaker();
        object oZesyyr = GetObjectByTag("q2amaezesyyr");
        object oZesGuard1 = GetObjectByTag("q2azesguard1");
        object oZesGuard2 = GetObjectByTag("q2azesguard2");

        object oTarget = GetWaypointByTag("wp_q2a_maehouse_exit");

        SetPlotFlag(oZesyyr, FALSE);
        DestroyObject(oZesyyr);
        SetPlotFlag(oZesGuard1, FALSE);
        DestroyObject(oZesGuard1);
        SetPlotFlag(oZesGuard2, FALSE);
        DestroyObject(oZesGuard2);

        location lHead1 = GetLocation(GetWaypointByTag("wp_q2a_zeshead1"));
        location lHead2 = GetLocation(GetWaypointByTag("wp_q2a_zeshead2"));
        location lHead3 = GetLocation(GetWaypointByTag("wp_q2a_zeshead3"));

        CreateObject(OBJECT_TYPE_PLACEABLE, "q2amaerebhead", lHead1);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q2amaerebhead", lHead2);
        CreateObject(OBJECT_TYPE_PLACEABLE, "q2amaerebhead", lHead3);

        AddJournalQuestEntry("q2_zesyyr", 98, oPC);

        //Evil alignment hit
        AdjustAlignment(oPC, ALIGNMENT_EVIL, 3);

        AssignCommand(oPC, JumpToObject(oTarget));


    }


}

void CallForHelp(object oMatron)
{
    if (GetIsDead(oMatron) == FALSE)
        AssignCommand(oMatron, PlaySpeakSoundByStrRef(85752)); //"Why aren't you other guards helping?"

}
