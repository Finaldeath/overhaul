#include "help_general"

void main()
{
    object oPC = GetLastUsedBy();
    object oHench = GetHenchman(oPC);
    object oKey = GetItemPossessedBy(oPC, "IT_MISC_KEY_001");

    if (GetIsPC(oPC))
    {
        if ((GetLocked(OBJECT_SELF) == FALSE))
        {
            if (GetTag(oHench) == "HENCH_LYEN")
            {
                AssignCommand(oPC, ClearAllActions(TRUE));
                AssignCommand(oHench, ClearAllActions(TRUE));
                AssignCommand(oHench, JumpToObject(oPC, FALSE));

                DelayCommand( 0.5f, AssignCommand(oHench,
                    ActionStartConversation(oPC, "hench_protect")));
            }
            else
            {
                if (!(GetIsOpen(OBJECT_SELF)))
                    AssignCommand(OBJECT_SELF, PlayAnimation(ANIMATION_PLACEABLE_OPEN));

                string sTag = GetTag(OBJECT_SELF);
                object oWP = GetWaypointByTag("WP_" + sTag);
                location lWP = GetLocation(oWP);

                SetMapPinEnabled(oWP, TRUE);
                SceneSpeak(oPC, "[You carefully descend through the trap door's entrance...]");
                DelayCommand(1.5, AssignCommand(oPC, JumpToLocation(lWP)));
                DelayCommand(1.7, DoSinglePlayerAutoSave());
            }
        }

        else
        {
            if (oKey != OBJECT_INVALID)
            {
                SetLocked(OBJECT_SELF, FALSE);
                SceneSpeak(oPC, "[You use the key on the locked trap door...]");
            }
            else
            {
                SceneSpeak(oPC, "[It appears this trap door is locked...]");
            }
        }
    }
}
