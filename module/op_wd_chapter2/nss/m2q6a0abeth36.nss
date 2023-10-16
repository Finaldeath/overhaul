// this sets the global so that the dream dialogue cannot be repeated and so
// that the player is able to tell Aarin about Aribeth's dreams whether or not
// Aarin mentioned them originally

void main()
{
    SetLocalInt(GetPCSpeaker(),"Aarin_Mention1",2);
}
