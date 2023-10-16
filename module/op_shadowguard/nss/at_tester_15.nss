#include "help_general"

void main()
{
    object oTest = GetNearestObjectByTag("NW_BANDIT001");
    string s;

    if (oTest == OBJECT_INVALID)
        s = "Object is invalid.";

    else
        s = "Object is valid.";

    if (GetIsListening(oTest))
        s += "  Object is listening for something.";

    else
        s += "  Object is not listening for anything.";

    SceneSpeak(OBJECT_SELF, s);
}
