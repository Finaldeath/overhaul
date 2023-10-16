//Instructor Jarvis gives the player the "Chronicles of Abaran" tome

void main()
{
    object oPC = GetPCSpeaker();
    CreateItemOnObject("sg_chronicles", oPC);
}
