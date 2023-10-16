#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
        if (GetFirstTimeIn())
            SceneSpeak(oPC, "[You notice a statue, carved in the likeness of Emperor Rakha, in the passage before you.  Its stone head eerily turns its gaze to follow your every move...]");
}
