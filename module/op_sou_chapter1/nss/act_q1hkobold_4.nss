//Set the snatch variable to one regardless of success or failure
//Set it on the kobold and the dialog object
void main()
{
    object oDialog = GetObjectByTag("q1hdialog");
    object oKobold = GetObjectByTag("q1h2_kblake");
    SetLocalInt(oDialog, "nSnatchAttempt", 1);
    SetLocalInt(oKobold, "nSnatchAttempt", 1);
    //Make a Dexterity roll vs DC 16
    int nRoll = d20() + GetAbilityModifier(ABILITY_DEXTERITY, GetPCSpeaker());
    if (nRoll >= 16)
    {
        SetLocalInt(oDialog, "nSnatchSucceed", 1);
        SetLocalInt(oKobold, "nSnatchSucceed", 1);
    }
}
