//:://////////////////////////////////////////////
//::
//::
//:: Controls the number of times you've talked to Jemanie, closes the
//:: Find Jemanie plot if you are on the plot.
//:: Increments the TalkTimes local each time this script is called.
//::
//::
//::
//:://////////////////////////////////////////////
//::
//:: Created By: Lukas Kristjanson
//:: Created On: Dec 17/01
//::
//:://////////////////////////////////////////////

void main()
{
object oPC = GetPCSpeaker();
int iJemState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q5_Begg_3a");

if (iJemState > 1 && iJemState < 20)
{
    AddJournalQuestEntry("M1Q5_Begg_3a", 20, oPC);
}
    SetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES",GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") + 1);
    SetLocalInt(GetModule(),"NW_G_M1Q5JemanieSpokenToXXX", 10);
}

