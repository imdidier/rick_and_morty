import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../infrastructure/models/character.dart';

class ItemCharacter extends StatelessWidget {
  final ResultCharacter resultCharacter;
  const ItemCharacter({Key? key, required this.resultCharacter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Column(
        children: [
          const SizedBox(height: 5),
          FadeIn(
            child: SizedBox(
              width: 190,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  resultCharacter.image,
                  fit: BoxFit.cover,
                  height: 200,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return Image.asset('assets/image-no-found.jpg');
                    }
                    return GestureDetector(
                      onTap: () =>
                          context.go('/home/0/character/${resultCharacter.id}'),
                      child: FadeIn(child: child),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          _Name(label: resultCharacter.name),
          _Status(label: resultCharacter.status),
        ],
      ),
    );
  }
}

class _Name extends StatelessWidget {
  final String label;
  const _Name({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme.titleMedium;

    return SizedBox(
      width: 190,
      child: Text(
        label,
        overflow: TextOverflow.ellipsis,
        style: styleText,
      ),
    );
  }
}

class _Status extends StatelessWidget {
  final String label;
  const _Status({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme.titleMedium;

    return SizedBox(
      width: 190,
      child: Text(
        label,
        overflow: TextOverflow.ellipsis,
        style: styleText,
      ),
    );
  }
}
