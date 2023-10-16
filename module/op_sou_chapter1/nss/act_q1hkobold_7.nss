//Make sure Blake no longer follows the PC everywhere
void main()
{
    object oBlake = GetObjectByTag("q1hblake");
    SetLocalInt(oBlake, "nFollow", 0);
}
