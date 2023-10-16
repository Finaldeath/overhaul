//::///////////////////////////////////////////////
//:: FileName act_q4c03velnis4
//:://////////////////////////////////////////////
//
//   Takes the cup, gives the mirror, and sets the plot as done.
//
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct. 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
void main()
{
    object oPC = (GetPCSpeaker());
    // Give the speaker the items
    CreateItemOnObject("q4cmirrorpiecea", oPC, 1);


    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(oPC, "q4c09holeygrail");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);

    // Set plot finished.
    FoundCrap(oPC);

    // Advance Journal
    AddJournalQuestEntry("poormerchant",30,oPC);
}
