#include "help_general"

void main()
{
    object o;

    object oWP = GetNearestObjectByTag("WP_NOBLE_RUN_TO");

    o = GetNearestObjectByTag("NW_NOBLFEMALE");

    AssignCommand(o, ActionMoveToObject(oWP, TRUE));

    DestroyObject(o, 4.0);

    o = GetNearestObjectByTag("NW_FEMALEKID01");

    AssignCommand(o, ActionMoveToObject(oWP, TRUE));

    DestroyObject(o, 4.0);
}
