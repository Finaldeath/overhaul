#include "NW_I0_GENERIC"
void main()
{
    if(Random(6) == 0)
    {
        SpeakOneLinerConversation("M1_AMBUSH1");
    }
    DetermineCombatRound();
}


