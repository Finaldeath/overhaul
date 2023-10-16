#include "help_general"

void main()
{
    if (GetLocalInt(OBJECT_SELF, "N_OPENED") == 0)
    {
        TestMessage("[DOOR CONVERSATION SHOULD BEGIN!!]");

        BeginConversation("", GetFirstPC());
    }
}
