#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetLocalInt(OBJECT_SELF, "N_DO_ONCE") == 0)
        {
            SceneSpeak(oPC, "[You find yourself dreaming, as you so often have in the last ten years, of that fateful night you awoke to the smell of flames and ash...]");

            object o1;
            object o2;

            o1 = GetNearestObjectByTag("CT_COMM_CF_FOLL", oPC, 1);
            o2 = GetNearestObjectByTag("PT_CORPSE", o1);
            SceneSpeak(o1, "Death to the Sharakhan Empire!  Your blood shall cleanse the path for the Crimson Prophet!");
            AssignCommand(o1, ActionAttack(o2));

            o1 = GetNearestObjectByTag("CT_COMM_CF_FOLL", oPC, 2);
            o2 = GetNearestObjectByTag("PT_CORPSE", o1);
            SceneSpeak(o1, "By the hand of the Crimson Prophet shall your evil taint be washed from Abaran!");
            AssignCommand(o1, ActionAttack(o2));

            SetLocalInt(OBJECT_SELF, "N_DO_ONCE", 1);
        }
    }
}
