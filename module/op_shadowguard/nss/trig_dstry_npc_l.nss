#include "help_general"

void main()
{
    object o = GetExitingObject();

    string s = GetSubString(GetTag(OBJECT_SELF), 16, GetStringLength(GetTag(OBJECT_SELF)));

    TestMessage("[Testing NPC Tag : [" + GetTag(o) + "] against string : [" + s + "]].");

    if (GetTag(o) == s)
    {
        object oLight = GetNearestObjectByTag("PLAC_LIGHT_" + s, o);

        DestroyObject(oLight);
    }
}
