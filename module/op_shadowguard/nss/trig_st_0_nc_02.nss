#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if ((GetIsPC(oPC) == TRUE) && (GetIsPossessedFamiliar(oPC) != TRUE))
    {
        object oTarin = GetNearestObjectByTag("HENCH_TARI");

        if (GetFirstTimeIn() && GetArea(oTarin) == GetArea(oPC))
        {
            RemoveAllEffects(oTarin);

            SceneSpeak(oTarin, "[The little Halfling slowly rises to his feet groggily.]  " + GetName(oPC) + ", is that you?  Oh, thank the gods you're here!");

            AssignCommand(oTarin, ActionStartConversation(oPC));
        }
    }
}
