// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetPCSpeaker();

    string s = GetJournalQuest(GetTag(OBJECT_SELF));;

    AddJournalSingle(s, 11, GetPCSpeaker());

    object oWP = GetNearestObjectByTag("WP_VARH_SPAWN_POINT");
    location lWP = GetLocation(oWP);

    string sVarh = "CT_UNIQ_SH_VARH";
    string sKara = "CT_UNIQ_SG_KARA";

    object oVarh = GetNearestObjectByTag(sVarh);

    DestroyObject(oVarh);

    object oKara = GetNearestObjectByTag(sKara);

    DestroyObject(oKara);

    SetLocalInt(OBJECT_SELF, "N_DONT_SPEAK", 1);

    AssignCommand(OBJECT_SELF, JumpToLocation(lWP));

    AssignCommand(GetPCSpeaker(), JumpToLocation(lWP));

    oVarh = CreateObject(OBJECT_TYPE_CREATURE, sVarh, lWP);

    DelayCommand(1.5, AssignCommand(oVarh, ActionSit(GetNearestObjectByTag("PT_" + GetTag(oVarh), oVarh))));

    DelayCommand(3.0, SceneSpeak(OBJECT_SELF, "[After a long search of the chamber, Captain Anagril finds nothing to suggest Chancellor Varhun to be a traitor...]  Sorry, " + GetName(oPC) + ", but it appears you were wrong about the Chancellor..."));

    DelayCommand(10.0, SceneSpeak(oVarh, "Thank you for helping settle this matter, Captain, and I have little desire for this affair to be brought out.  Let's just leave it at a misunderstanding, shall we?"));

    DelayCommand(17.0, SceneSpeak(OBJECT_SELF, "That sounds fine to me.  " + GetName(oPC) + ", you should be a bit more careful of what you accuse people of in the future..."));

    oWP = GetNearestObjectByTag("WP_ANAG_SPAWN_POINT");
    lWP = GetLocation(oWP);

    DelayCommand(24.0, AssignCommand(OBJECT_SELF, ActionMoveToLocation(lWP)));

    DelayCommand(27.0, AssignCommand(OBJECT_SELF, JumpToLocation(lWP)));

    DelayCommand(26.0, SetLocalInt(OBJECT_SELF, "N_DONT_SPEAK", 0));
}
