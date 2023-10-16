// * when player enters this trigger, set the
// * end henchmen speech is now valid
// * when player exits the trigger, this local will be removed
// * Also, the henchmen 'end speech' global will be set on the
//* henchmen while they are in the trigger and removed later.
void main()
{
    object oEnter = GetEnteringObject();

    if (GetIsObjectValid(oEnter) == TRUE)
    {
        if (GetIsPC(oEnter) == TRUE)
        {
            SetLocalInt(oEnter, "NW_L_ENDPLAYERSPEECH", 0);
        }
        else
        {
            if (GetLocalInt(oEnter, "NW_L_ENDSPEECH") == 10)
            {
                SetLocalInt(oEnter, "NW_L_ENDSPEECH", 0);
            }
        }
    }
}
