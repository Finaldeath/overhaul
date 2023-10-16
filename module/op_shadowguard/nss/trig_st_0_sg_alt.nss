#include "help_general"
#include "help_hench"

void main()
{
    object o = GetEnteringObject();

    if (GetTag(o) == "HENCH_KARA" && GetLocalInt(OBJECT_SELF, "N_DO_ONCE") == 0)
    {
        SceneSpeak(o, "[Kara points ahead to a large glowing altar.]  Look!  The Heart of Rakha lies ahead!");

        SetLocalInt(OBJECT_SELF, "N_DO_ONCE", 1);
    }
}
