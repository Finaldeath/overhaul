#include "NW_I0_GENERIC"

void main()
{
    SetLocalInt(OBJECT_SELF, "Generic_Surrender",1);
    SurrenderToEnemies();
    ClearAllActions();
    SpeakOneLinerConversation();
}
