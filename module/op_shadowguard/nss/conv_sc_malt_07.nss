#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetPCSpeaker();

//    SceneSpeak(oPC, "[Malthar and his men quickly exit the cavern, taking their prize with them...]");

    //Make the Nightcrawlers flee.
    object oWP = GetNearestObjectByTag("WP_EXIT");
    object o = GetFirstFactionMember(OBJECT_SELF, FALSE);
    while (o != OBJECT_INVALID)
    {
        if (GetArea(o) == GetArea(OBJECT_SELF))
        {
            SetLocalInt(o, "N_DONT_SPEAK", 1);
            SetPlotFlag(o, TRUE);
            AssignCommand(o, ClearAllActions());
            AssignCommand(o, ActionMoveToObject(oWP, TRUE));
            DestroyObject(o, 6.0);
        }
        o = GetNextFactionMember(OBJECT_SELF, FALSE);
    }

    //Double-check to make sure the player has no henchmen.
    RemoveHenchman(oPC, GetHenchman(oPC));

    //Destroy Tarin
    object oTarin = GetNearestObjectByTag("HENCH_TARI", oPC);
    if (GetArea(oTarin) == GetArea(oPC))
    {
        DestroyObject(oTarin);
    }

    //Open Tarin's cell door
    object oDoor = GetNearestObjectByTag("DOOR_ST_0_NC_LAIR_02");
    SetLocked(oDoor, FALSE);
    AssignCommand(oDoor, ActionOpenDoor(oDoor));

    //Wake Brukus up and force a conversation.
    object oBrukus = GetNearestObjectByTag("HENCH_BRUK", oPC);
    if (GetArea(oBrukus) == GetArea(oPC))
    {
        RemoveAllEffects(oBrukus);
        AssignCommand(oBrukus, ActionStartConversation(oPC));
    }

    //Handle gold and journal entries
    GiveGoldToCreature(oPC, GetLocalInt(oPC, GetJournalQuest(GetTag(OBJECT_SELF)) + "N_REWARD"));
    AddJournalSingle("JT_PREL_TARI", 15, oPC);
}
