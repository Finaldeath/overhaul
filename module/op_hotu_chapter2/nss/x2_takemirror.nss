///Take Mirror from PC, mark player as having given mirror

#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
     //Remove the mirror from the PC inventory
    object oMirror = GetLocalObject(OBJECT_SELF, "oMirror");
    DestroyObject(oMirror);

    //Mark brain as being given mirror
    SetLocalInt(GetModule(),"elder_brain",3);


    AddJournalQuestEntry("q2_zorvakmur",99,oPC);

    Reward_2daXP(oPC, 50);
}
