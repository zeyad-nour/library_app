import 'package:flutter/material.dart';

class DetailsActionBar extends StatelessWidget {
  const DetailsActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),

        decoration: const BoxDecoration(
          color: Colors.white,

          border: Border(top: BorderSide(color: Color(0xffE2E8F0))),
        ),

        child: Row(
          children: [
            Container(
              width: 58,
              height: 58,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),

                border: Border.all(color: const Color(0xff2563EB), width: 2),
              ),

              child: IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Book saved")));
                },

                icon: const Icon(
                  Icons.bookmark_add_outlined,
                  color: Color(0xff2563EB),
                ),
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: SizedBox(
                height: 58,

                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Book borrowed successfully"),
                      ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2563EB),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: const [
                      Icon(Icons.download_outlined, color: Colors.white),

                      SizedBox(width: 10),

                      Text(
                        "Borrow Now",

                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
