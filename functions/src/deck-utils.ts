export const deckOptions = [
  "emberus",
  "ignis",
  "blazeon",
  "flamara",
  "pyyrhus",
  "embrella",
  "solara",
  "flamorion",
  "solarius",
  "dramber",
  "triton",
  "oceanus",
  "river",
  "nereus",
  "dylan",
  "kai",
  "marina",
  "neptune",
  "caroline",
  "aquarius",
  "terra",
  "gaia",
  "lyra",
  "flint",
  "boulder",
  "arvid",
  "gideon",
  "onyx",
  "ragnar",
  "thorin",
  "aero",
  "nova",
  "aurora",
  "seraphina",
  "celeste",
  "luna",
  "ember",
  "aria",
  "zephyr",
  "orion",
];

/**
      Creates a user document in Firestore when a new user is created.

    @param {object} array - The array which contains all strings to pick random.
    @param {object} count - The int which hold how many random element you want.
    @return {Promise} from "array", "count" time random elemented list.
     */
export function getRandomUniqueItemsFromArray(
  array: string[],
  count: number,
): string[] {
  const shuffled = array.slice();
  let i = array.length;
  let temp;
  let index;

  while (i--) {
    index = Math.floor((i + 1) * Math.random());
    temp = shuffled[index];
    shuffled[index] = shuffled[i];
    shuffled[i] = temp;
  }

  return shuffled.slice(0, count);
}
