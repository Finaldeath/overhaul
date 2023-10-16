#include "help_skills"
#include "help_general"

void main()
{
    object o = GetEnteringObject();

    // Do a DC 25 Spot check
    if (SkillCheck(o, SKILL_SPOT, 25))
    {
        if (GetIsPC(o))
        {
            SceneSpeak(o, "[Spot]  [You notice the smoke surrounding the nearby statue of Emperor Rakha is moving against the wind... perhaps from some unseen flow of air...");
        }

        else if (GetIsPC(GetMaster(o)) && GetHenchman(GetMaster(o)) == o)
        {
            SceneSpeak(o, GetName(GetMaster(o)) + ", that statue of Emperor Rakha appears a bit strange...  See how the smoke drifts from it, as if by some flow of air?  It might be worth looking into...");
        }
    }
}
