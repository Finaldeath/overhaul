#include "help_general"

void main()
{
    object oPC = GetLastUsedBy();

    if (GetIsPC(oPC))
    {
        if (!(GetLocked(OBJECT_SELF)))
        {
            if (!(GetIsOpen(OBJECT_SELF)))
                AssignCommand(OBJECT_SELF, PlayAnimation(ANIMATION_PLACEABLE_OPEN));

            string sTag = GetTag(OBJECT_SELF);

            object oWP = GetWaypointByTag("WP_" + sTag);

            SetMapPinEnabled(oWP, TRUE);

            location lWP = GetLocation(oWP);

            AssignCommand(oPC, JumpToLocation(lWP));
        }

        else
            SceneSpeak(oPC, "[It appears this trap door is locked...]");
    }
}
